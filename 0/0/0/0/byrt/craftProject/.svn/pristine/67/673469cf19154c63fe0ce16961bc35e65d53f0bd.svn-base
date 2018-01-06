package com.craft.util;


/**
 * modbus 协议数据转换工具类
 */
public class ModbusMsgUtils {


    /**
     * 获取协议数据中 高位在前的 byte[2] 的实际值
     *
     * @param data        byte 数组
     * @param index       byte 数组中将要转换的数据的起始位置
     * @param coefficient 系数
     * @param offset      偏移量
     * @return
     */
    public static double convertProtocolData(byte[] data, int index, int coefficient, float offset) {

        int targets = (data[index + 1] & 0xff) | ((data[index] << 8) & 0xff00);
        return convertProtocolData(targets, coefficient, offset);
    }


    /**
     * @param data        协议数据
     * @param coefficient 除以该系数
     * @return
     */
    public static double convertProtocolData(int data, int coefficient) {
        if (data < 0) {
            return -1;
        }
        if (data == 0) {
            return 0;
        }

        double res = BigDecimalUtils.div((double) data, (double) coefficient, 2);

        return res;

    }

    /**
     * @param data        协议数据
     * @param coefficient 系数
     * @param offset
     * @return
     */
    public static double convertProtocolData(int data, int coefficient, float offset) {
        if (data < 0) {
            return -1;
        }
        if (data == 0) {
            return 0;
        }

        double res = BigDecimalUtils.div((double) data, (double) coefficient, 2);
        res = BigDecimalUtils.sub(res, offset);

        return res;

    }


    public static void main(String[] args) {
        int data = 12003;
        System.out.print(ModbusMsgUtils.convertProtocolData(data, 10, 1200) + " ");
        data = 4115;
        System.out.print(ModbusMsgUtils.convertProtocolData(data, 10, -400) + " ");
    }
}
