# nemanovich_infra
nemanovich Infra repository

[Slack channel](https://devops-team-otus.slack.com/messages/CDJ6BJDME)

bastion_IP = 35.210.80.197  
someinternalhost_IP = 10.132.0.3

One-liner для подключения к someinternalhost: ```ssh -A -tt otus@104.199.12.75 ssh 10.132.0.3```  
Config для подключения с алиасом ```ssh someinternalhost``` (Windows-edition):
```
Host bastion
  Hostname 35.210.80.197
  User otus
  IdentityFile C:\\Users\\<username>\\.ssh\\otus

Host someinternalhost
  Hostname 10.132.0.3
  User otus
  IdentityFile C:\\Users\\<username>\\.ssh\\otus
  ProxyJump bastion
```

Развернуто приложение https://github.com/express42/reddit.git через gcloud + startup-script:
testapp_IP = 35.234.79.54
testapp_port = 9292 

Команда для запуска: 
```
gcloud compute instances create reddit-app \
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server  \
  --restart-on-failure \
  --metadata-from-file startup-script=/startup_script.sh
```
Команда для создания правила в firewall:
```gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --target-tags puma-server```

В /packer лежат: базовый (ubuntu16.json) и полный (immutable.json) образы для деплоя приложения reddit с помощью packer, а также файл с переменными packer для них.
/config-scripts/create-reddit-vm.sh - gcloud скрипт для запуска инстанса с полным image reddit

###terraform-1
В /terraform добавлено tf-описание развертывания приложения reddit с правилом firewall default-puma-server
 и добавлением ssh ключей в metadata проекта. Note! При `terraform apply` происходит перезаписывание ключей поверх существующих.


 
