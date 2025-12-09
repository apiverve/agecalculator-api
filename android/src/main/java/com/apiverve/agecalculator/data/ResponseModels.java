// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     AgeCalculatorData data = Converter.fromJsonString(jsonString);

package com.apiverve.agecalculator.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static AgeCalculatorData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(AgeCalculatorData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(AgeCalculatorData.class);
        writer = mapper.writerFor(AgeCalculatorData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// AgeCalculatorData.java

package com.apiverve.agecalculator.data;

import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;

public class AgeCalculatorData {
    private LocalDate dob;
    private long ageYears;
    private long ageMonths;
    private long ageWeeks;
    private long ageDays;
    private AgeWords ageWords;

    @JsonProperty("dob")
    public LocalDate getDob() { return dob; }
    @JsonProperty("dob")
    public void setDob(LocalDate value) { this.dob = value; }

    @JsonProperty("age_years")
    public long getAgeYears() { return ageYears; }
    @JsonProperty("age_years")
    public void setAgeYears(long value) { this.ageYears = value; }

    @JsonProperty("age_months")
    public long getAgeMonths() { return ageMonths; }
    @JsonProperty("age_months")
    public void setAgeMonths(long value) { this.ageMonths = value; }

    @JsonProperty("age_weeks")
    public long getAgeWeeks() { return ageWeeks; }
    @JsonProperty("age_weeks")
    public void setAgeWeeks(long value) { this.ageWeeks = value; }

    @JsonProperty("age_days")
    public long getAgeDays() { return ageDays; }
    @JsonProperty("age_days")
    public void setAgeDays(long value) { this.ageDays = value; }

    @JsonProperty("age_words")
    public AgeWords getAgeWords() { return ageWords; }
    @JsonProperty("age_words")
    public void setAgeWords(AgeWords value) { this.ageWords = value; }
}

// AgeWords.java

package com.apiverve.agecalculator.data;

import com.fasterxml.jackson.annotation.*;

public class AgeWords {
    private String years;
    private String ordinal;
    private String full;

    @JsonProperty("years")
    public String getYears() { return years; }
    @JsonProperty("years")
    public void setYears(String value) { this.years = value; }

    @JsonProperty("ordinal")
    public String getOrdinal() { return ordinal; }
    @JsonProperty("ordinal")
    public void setOrdinal(String value) { this.ordinal = value; }

    @JsonProperty("full")
    public String getFull() { return full; }
    @JsonProperty("full")
    public void setFull(String value) { this.full = value; }
}