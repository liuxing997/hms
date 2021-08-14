package com.hqyj.seven.pojo;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * @File PageData.java
 * @Auth liuxing
 * @Date 2021/8/14 17:45
 * @Email liuxing997@foxmail.com
 */
public class PageData <T> {
    //当前页码
    private int currentPage;
    //每页记录数
    private int pageSize;
    //总页数
    private int totalPage;
    //总记录数
    private int totalSize;

    //上一页页码
    private int previousPage;
    //下一页页码
    private int nextPage;
    //每页的用户信息、list
    private List<T> list;

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
    }

    public int getPreviousPage() {
        return previousPage;
    }

    public void setPreviousPage(int previousPage) {
        this.previousPage = previousPage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageData{" +
                "currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", totalPage=" + totalPage +
                ", totalSize=" + totalSize +
                ", previousPage=" + previousPage +
                ", nextPage=" + nextPage +
                ", list=" + list +
                '}';
    }
}
