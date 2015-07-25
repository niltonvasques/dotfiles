import os;
import subprocess;
import sys

def mailpasswd(acct):
  args = ["pass", acct]
  try:
    passwd =  subprocess.check_output(args)
    #sys.stdout.write(passwd)
    return passwd.strip()
  except subprocess.CalledProcessError:
    return ""
