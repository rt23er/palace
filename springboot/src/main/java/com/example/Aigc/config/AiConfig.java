package com.example.Aigc.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
public class AiConfig {

    @Value("${api-key}")
    private String ApiKey;
}
