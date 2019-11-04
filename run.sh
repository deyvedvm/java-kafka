
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
