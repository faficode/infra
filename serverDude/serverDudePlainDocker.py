import subprocess
import sys

action = sys.argv[1]
app = sys.argv[2]
machine = sys.argv[3]
user = sys.argv[4]
keyPath = sys.argv[5]
connString = f'{user}@{machine}'

conf = {
    "jenkins": [
        '--restart', 'unless-stopped', '--name', 'jenkins', '-p', '8080:8080', '-p', '50000:50000',
        '-v', '/opt/cd/jenkins:/var/jenkins_home',
        '-e', 'JAVA_OPTS=-Djenkins.install.runSetupWizard=false',
        'jenkins/jenkins:lts'
    ]
}


def runcmd(args):
    print(args)
    subprocess.call(args)


def create():
    args = ['ssh', '-i', keyPath, connString, '--', 'sudo', 'docker', 'create']
    args.extend(conf[app])
    runcmd(args)


def start():
    args = ['ssh', '-i', keyPath, connString, '--', 'sudo', 'docker', 'start', app]
    runcmd(args)


def stop():
    args = ['ssh', '-i', keyPath, connString, '--', 'sudo', 'docker', 'stop', app]
    runcmd(args)


def rm():
    args = ['ssh', '-i', keyPath, connString, '--', 'sudo', 'docker', 'rm', app]
    runcmd(args)


if action == 'create':
    create()
elif action == 'stop':
    stop()
elif action == 'start':
    start()
elif action == 'rm':
    rm()
elif action == 'createAndStart':
    create()
    start()

