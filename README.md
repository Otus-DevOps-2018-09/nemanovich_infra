# nemanovich_infra
nemanovich Infra repository

[Slack channel](https://devops-team-otus.slack.com/messages/CDJ6BJDME)

bastion_IP = 104.199.12.75
someinternalhost_IP = 10.132.0.3

One-liner для подключения к someinternalhost: ```ssh -A -tt otus@104.199.12.75 ssh 10.132.0.3```  
Config для подключения с алиасом ```ssh someinternalhost``` (Windows-edition):
```
Host bastion
  Hostname 104.199.12.75
  User otus
  IdentityFile C:\\Users\\<username>\\.ssh\\otus

Host someinternalhost
  Hostname 10.132.0.3
  User otus
  IdentityFile C:\\Users\\<username>\\.ssh\\otus
  ProxyJump bastion
```

