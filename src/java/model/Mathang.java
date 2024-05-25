/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Mathang {

    private String Mahang;
    private String tenHang;
    private String soLuong;
    private String giaBan;

    public String getMahang() {
        return Mahang;
    }

    public String getTenHang() {
        return tenHang;
    }

    public String getSoLuong() {
        return soLuong;
    }

    public String getGiaBan() {
        return giaBan;
    }

    public void setMahang(String Mahang) {
        this.Mahang = Mahang;
    }

    public void setTenHang(String tenHang) {
        this.tenHang = tenHang;
    }

    public void setSoLuong(String soLuong) {
        this.soLuong = soLuong;
    }

    public void setGiaBan(String giaBan) {
        this.giaBan = giaBan;
    }

    public Mathang(String Mahang, String tenHang, String soLuong) {
        this.Mahang = Mahang;
        this.tenHang = tenHang;
        this.soLuong = soLuong;
    }

    public Mathang() {
    }

    public Mathang(String tenHang, String giaBan) {
        this.tenHang = tenHang;
        this.giaBan = giaBan;
    }
}
