from prometheus_client import start_http_server, Gauge
import random
import time

cpu_spike = Gauge('glitchbox_cpu_spike', 'Random CPU load spike (%)')
memory_pressure = Gauge('glitchbox_memory_pressure', 'Simulated memory usage (%)')
crash_count = Gauge('glitchbox_crash_count', 'Number of simulated crashes')
network_latency = Gauge('glitchbox_network_latency', 'Injected network latency (ms)')
disk_filled = Gauge('glitchbox_disk_filled_mb', 'Disk space filled (MB)')
app_hang = Gauge('glitchbox_app_hang', 'Application hang status (1=hung, 0=ok)')

if __name__ == '__main__':
    start_http_server(8080)
    while True:
        cpu_spike.set(90)
        memory_pressure.set(95)
        crash_count.set(random.randint(0, 3))
        network_latency.set(random.choice([0, 3000]))
        disk_filled.set(random.choice([0, 512]))
        app_hang.set(random.choice([0, 1]))
        time.sleep(5)

