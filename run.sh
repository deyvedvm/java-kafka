
# Download de Kafka
wget http://ftp.unicamp.br/pub/apache/kafka/2.3.1/kafka_2.12-2.3.1.tgz

# Extract the content
tar -xvf kafka_2.12-2.3.1.tgz

# Check if kafka works
bin/kafka-topics.sh

# One option is add pah to .bashrc or similar
# export PATH=/home/deyve/git/kafka/kafka_2.12-2.3.1/bin:$PATH

# Create this folders
mkdir data
mkdir data/zookeeper

# Edit zookeeper.properties
vim config/zookeeper.properties

# Edit this line
# dataDir=/tmp/zookeeper
# dataDir=/home/deyve/git/kafka/kafka_2.12-2.3.1/data/zookeeper

# Execute Zookeeper
bin/zookeeper-server-start.sh config/zookeeper.properties

 # Create kafka folder
mkdir data/kafka

# Edit Kafka properties
vim config/server.properties

# Edit this line
# log.dirs=/tmp/kafka-logs
# log.dirs=/home/deyve/git/kafka/kafka_2.12-2.3.1/data/kafka

# Execute Kafka
bin/kafka-server-start.sh config/server.properties


# Create a topic with name first_topic

bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic first_topic

# We can now see that topic if we run the list topic command

bin/kafka-topics.sh --list --bootstrap-server localhost:9092

# We can describe informations of topic

bin/kafka-topics.sh --describe --bootstrap-server localhost:9092

bin/kafka-topics.sh --describe --topic first_topic --bootstrap-server localhost:9092

# Delete topic

bin/kafka-topics.sh --delete --topic second_topic --bootstrap-server localhost:9092
