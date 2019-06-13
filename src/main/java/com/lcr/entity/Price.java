package com.lcr.entity;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
public class Price {
    private Integer id;
    private String count;
    private Date date;
}
