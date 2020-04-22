package dev.deyve.kafka.producers;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Properties;

public class Producer {

    public static void main(String[] args) {

        String BOOTSTRAP_SERVERS = System.getenv("BOOTSTRAP_SERVERS");

        // create Producer properties
        Properties properties = new Properties();
        properties.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, BOOTSTRAP_SERVERS);

        // Kafka converts whenever you send into bytes
//        properties.setProperty(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
//        properties.setProperty(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());

        Event firstEvent = new Account(true, 100, new ArrayList<>());

        Event secondEvent = new Transaction("Burger King", new BigDecimal(20));

        // create the producer
        KafkaProducer<String, Event> producer = new KafkaProducer<>(properties, new StringSerializer(), new KafkaJsonSerializer());

        // create a producer record
        ProducerRecord<String, Event> firstRecord = new ProducerRecord<>("account-creation", firstEvent);

        ProducerRecord<String, Event> secondRecord = new ProducerRecord<>("transaction-authorization", secondEvent);

        // send data - asynchronous
        producer.send(firstRecord);
        producer.send(secondRecord);

        // flush data
        producer.flush();

        // flush and close producer
        producer.close();
    }

}
