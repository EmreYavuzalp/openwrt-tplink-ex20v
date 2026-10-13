#!/bin/sh
# econet platform packet-steering hook.
#
# The generic /usr/libexec/network/packet-steering.uc spreads RPS across all
# CPUs. On the TP-Link EX20v that is suboptimal: the ethernet RX-NAPI is fixed
# to CPU0 and the mt76 Wi-Fi RX-NAPI to CPU2 (their hard IRQs cannot be
# reaffined off the MIPS GIC), so each receive core should stay dedicated to
# its NAPI while the NAT/PPPoE forwarding is pushed onto the two otherwise-idle
# cores. Steer the forward path onto CPU1+CPU3 (mask 0xa) with RPS. Only the
# software-forwarded Wi-Fi<->WAN path is affected; PPE-offloaded wired traffic
# never reaches the CPU. Re-runs on every network reload via the packet_steering
# service triggers, so late-appearing devices (wifi, pppoe) are covered too.
#
# $1 = network.@globals[0].packet_steering uci value (unused for EX20v; the
# tuned scheme is always applied). Every other econet board falls through to
# the generic implementation unchanged.

board="$(cat /tmp/sysinfo/board_name 2>/dev/null)"

if [ "$board" != "tplink,ex20v" ]; then
	steering_flows="$(uci -q get network.@globals[0].steering_flows)"
	[ "${steering_flows:-0}" -gt 0 ] && set -- -l "$steering_flows" "$@"
	exec /usr/libexec/network/packet-steering.uc "$@"
fi

for dev in eth0 phy0-ap0 phy1-ap0; do
	for q in /sys/class/net/"$dev"/queues/rx-*/rps_cpus; do
		[ -e "$q" ] && echo a > "$q" 2>/dev/null
	done
done

exit 0
