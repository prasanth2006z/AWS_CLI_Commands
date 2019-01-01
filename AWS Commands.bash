
#######@@Security Groups@@#######

#Create Security Groups
	aws ec2 create-security-group --group-name First-security-group --description "My First security group" --vpc-id vpc-0f20f8f07eea66e8f

#Associate Ingress-rule to Security Groups

	#one way
		aws ec2 authorize-security-group-ingress --group-id sg-015dad3f98f66035e --protocol tcp --port 22 --cidr 10.0.0.0/22

	#Another Way!!!!

		aws ec2 authorize-security-group-ingress --group-id sg-015dad3f98f66035e --ip-permissions IpProtocol=tcp,FromPort=80,ToPort=80,IpRanges=[{CidrIp=0.0.0.0/0,Description="Opened Http port for IPv4"}],Ipv6Ranges=[{CidrIpv6=0:0:0:0::/0,Description="Opened Http port for IPv6"}]


		aws ec2 authorize-security-group-ingress --group-id sg-015dad3f98f66035e --ip-permissions IpProtocol=tcp,FromPort=443,ToPort=443,IpRanges=[{CidrIp=0.0.0.0/0,Description="Opened Https port for IPv4"}],Ipv6Ranges=[{CidrIpv6=0:0:0:0::/0,Description="Opened Https port for IPv6"}]

#Remove a Ingress-rule from a security group
	aws ec2 revoke-security-group-ingress --group-id sg-015dad3f98f66035e --protocol tcp --port 22 --cidr 0.0.0.0/0

#Delete Security Groups
aws ec2 delete-security-group --group-id sg-015dad3f98f66035e

