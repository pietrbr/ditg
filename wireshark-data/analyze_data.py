import pyshark
import os
import statistics
import matplotlib.pyplot as plt

file_dir = os.path.dirname(os.path.realpath(__file__))

# list to store files
flow = []
flow_1 = []
flow_1_a = []
flow_1_r = []
flow_2 = []
flow_2_a = []
flow_2_r = []
flow_3 = []
flow_3_a = []
flow_3_r = []

mavlink_hl_string = "MAVLINK_PROTO"
nonmav_cnt = 0
mav_cnt = 0
pcktcnt = 0
time = 0

## debug section
# cap = list(pyshark.FileCapture('/home/pietro/Documents/ditg/wireshark-data/capture-armed-1.pcapng'))
# time = cap[-1].sniff_time - cap[0].sniff_time
# time_span_s = time.seconds + time.microseconds / 10**6
# print(time, time_span_s)
# quit()

# Iterate directory
for file in os.listdir(file_dir):
    # check only .pcapng files
    if file.endswith('.pcapng'):
        cap = list(pyshark.FileCapture(file_dir+'/'+file,
                                  'lua_script:/home/pietro/.local/lib/wireshark/plugins/mavlink_2_common.lua',
                                  display_filter='mavlink_proto'))
        time_span = cap[-1].sniff_time - cap[0].sniff_time
        time = time + time_span.seconds + time_span.microseconds / 10**6
        print("Analyzing ", file, "...")
        for pckt in cap:
            pcktcnt = pcktcnt + 1  # counter
            if pckt.highest_layer == mavlink_hl_string:
                mav_cnt = mav_cnt + 1  # counter
                if("TCP" in str(pckt.layers) and int(pckt.tcp.len) >= 80 and int(pckt.tcp.len) < 250):
                    # flow_1.append(int(pckt.tcp.len))
                    if int(pckt.tcp.port) == 5760:
                        flow_1_a.append(int(pckt.tcp.len))
                    else:
                        flow_1_r.append(int(pckt.tcp.len))

                if("TCP" in str(pckt.layers) and int(pckt.tcp.len) >= 60 and int(pckt.tcp.len) < 80):
                    # flow_2.append(int(pckt.tcp.len))
                    # flow.append(int(pckt.tcp.len))
                    if int(pckt.tcp.port) == 5760:
                        flow_2_a.append(int(pckt.tcp.len))
                    else:
                        flow_2_r.append(int(pckt.tcp.len))

                if("TCP" in str(pckt.layers) and int(pckt.tcp.len) >= 5 and int(pckt.tcp.len) < 60):
                    # flow_3.append(int(pckt.tcp.len))
                    # flow.append(int(pckt.tcp.len))
                    if int(pckt.tcp.port) == 5760:
                        flow_3_a.append(int(pckt.tcp.len))
                    else:
                        flow_3_r.append(int(pckt.tcp.len))
            else:
                nonmav_cnt = nonmav_cnt + 1  # counter

# # Results
# avg_1 = statistics.mean(flow_1)
# avg_2 = statistics.mean(flow_2)
# avg_3 = statistics.mean(flow_3)
# stdev_1 = statistics.pstdev(flow_1)
# stdev_2 = statistics.pstdev(flow_2)
# stdev_3 = statistics.pstdev(flow_3)
# var_1 = statistics.pvariance(flow_1)
# var_2 = statistics.pvariance(flow_2)
# var_3 = statistics.pvariance(flow_3)

# print('\n###################################################################',
#       '\n\t\t\t\t flow 1\t\t\tflow 2\t\t\tflow 3')
# print('\nAverage: \t\t', avg_1, "\t", avg_2, "\t", avg_3)
# print("Standard Deviation: \t", stdev_1, "\t", stdev_2, "\t", stdev_3)
# print("Variance: \t\t", var_1, "\t", var_2, "\t", var_3)
# print("\npckt count ", pcktcnt, " - mav packets ", mav_cnt, " - non mav packets ",nonmav_cnt)


# Results
# way forth
avg_1_a = statistics.mean(flow_1_a)
avg_2_a = statistics.mean(flow_2_a)
avg_3_a = statistics.mean(flow_3_a)
stdev_1_a = statistics.pstdev(flow_1_a)
stdev_2_a = statistics.pstdev(flow_2_a)
stdev_3_a = statistics.pstdev(flow_3_a)
# way back
avg_1_r = statistics.mean(flow_1_r)
avg_2_r = statistics.mean(flow_2_r)
avg_3_r = statistics.mean(flow_3_r)
stdev_1_r = statistics.pstdev(flow_1_r)
stdev_2_r = statistics.pstdev(flow_2_r)
stdev_3_r = statistics.pstdev(flow_3_r)


# way forth
print('\nWay forth #######################################################',
      '\n\t\t\t\t flow 1\t\t\tflow 2\t\t\tflow 3')
print('\nAverage: \t\t', avg_1_a, "\t", avg_2_a, "\t", avg_3_a)
print("Standard Deviation: \t", stdev_1_a, "\t", stdev_2_a, "\t", stdev_3_a)
# way back
print('\nWay back #######################################################',
      '\n\t\t\t\t flow 1\t\t\tflow 2\t\t\tflow 3')
print('\nAverage: \t\t\t', avg_1_r, "\t\t", avg_2_r, "\t\t", avg_3_r)
print("Standard Deviation: \t\t", stdev_1_r, "\t", stdev_2_r, "\t", stdev_3_r)

print('\nTime ###########################\n', time)
# print("\npckt count ", pcktcnt, " - mav packets ", mav_cnt, " - non mav packets ",nonmav_cnt)

# plt1 = plt.plot(flow_1_a)
# plt.show()
# plt2 = plt.plot(flow_2_a)
# plt.show()
plt3 = plt.plot(flow_3_a)
plt.show()

# plt1 = plt.plot(flow_1_r)
# plt.show()
# plt2 = plt.plot(flow_2_r)
# plt.show()
plt3 = plt.plot(flow_3_r)
plt.show()

# Normal distribution of flow 3 a
dis = [0] * 85
for pckt in flow_3_a:
    dis[pckt-1] = dis[pckt-1] + 1
plt3 = plt.plot(dis)
plt.show()

# Normal distribution of flow 3 r
dis = [0] * 85
for pckt in flow_3_r:
    dis[pckt-1] = dis[pckt-1] + 1
plt3 = plt.plot(dis)
plt.show()