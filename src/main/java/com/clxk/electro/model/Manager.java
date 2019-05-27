package com.clxk.electro.model;

/**
 * @Description 管理员实体类
 * @Author Clxk
 * @Date 2019/4/2 15:19
 * @Version 1.0
 */
public class Manager {

    private int id;
    private String username;
    private String password;
    private int level;
    private String name;
    private String nick;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public Manager() {

    }

    public Manager(String username, String password, int level) {
        this.username = username;
        this.password = password;
        this.level = level;
    }
}
