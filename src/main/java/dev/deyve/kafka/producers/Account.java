package dev.deyve.kafka.producers;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;

public class Account implements Event {

    @JsonProperty("active-card")
    private Boolean activeCard;

    @JsonProperty("available-limit")
    private Integer availableLimit;

    @JsonProperty("violations")
    private ArrayList<String> violations;

    public Account() {
    }

    public Account(Boolean activeCard, Integer availableLimit, ArrayList<String> violations) {
        this.activeCard = activeCard;
        this.availableLimit = availableLimit;
        this.violations = violations;
    }

}
