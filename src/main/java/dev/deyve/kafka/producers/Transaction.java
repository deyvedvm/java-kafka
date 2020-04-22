package dev.deyve.kafka.producers;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Transaction implements Event {

    private String merchant;

    private BigDecimal amount;

    private LocalDateTime time;

    public Transaction(String merchant, BigDecimal amount) {
        this.merchant = merchant;
        this.amount = amount;
        this.time = LocalDateTime.now();
    }
}
