package com.lcr.dao;

import com.lcr.entity.Price;

import java.util.Date;

public interface PriceDao {
    /***
     * 添加金额
     * @param price
     * @return
     */
    public int insert(Price price);

    /***
     * 根据日期修改金额
     * @param date
     * @return
     */
    public int update(Date date);

    /***
     * 根据日期查询金额
     * @param date
     * @return
     */
    public Price queryByDate(Date date);
}
