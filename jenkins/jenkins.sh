echo "start.."
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
echo "Installation of Jenkins"
sudo apt-get install jenkins
echo "Start Jenkin Server"
sudo systemctl start jenkins
echo "http://ip_address_or_domain_name:8080"
echo "Copy password"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
