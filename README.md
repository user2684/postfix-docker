# Postfix (ARM) #

Postfix mail server on Raspbian (ARM architecture)

## Docker Image Features ##

* Expose port 25
* All the files in the mounted `/postfix` directory will be copied into `/etc/postfix` before starting the service
* Optionally map `/var/spool/postfix` to a volume if you want to persist the mail queue
* Output mail log information

## How to Run It ##

~~~
docker run -p 25:25 -v $(pwd)/postfix:/postfix user2684/postfix
~~~

## Tags ##
* [`latest`](https://github.com/user2684/postfix-docker/blob/master/Dockerfile)

