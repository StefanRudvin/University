package com.company;

class User {

    int userId;
    String[] books;

    // Constructor method
    User(int userId, String[] books) {
        this.userId = userId;
        this.books = books;
    }

    static int getBookCount(User user) {
        int counter = 0;
        for (int i = 0; i < user.books.length; i ++)
            if (user.books[i] != null)
                counter ++;
        return counter;
    }

}
