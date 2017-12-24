package com.company;

import java.util.HashMap;
import java.util.Iterator;

public class Main {

    private String[] [] books = Vars.books;

    private int [] userIds = Vars.userIds;

    private User[] userObjects = new User[userIds.length];


    public static void main(String[] args) {

        Main mainClass = new Main();

        mainClass.instantiateUsers();

        // 1.2
        mainClass.getUserBookCount();

        // 1.3
        mainClass.getTotalBookCount();
    }

    private void getTotalBookCount() {

        HashMap<String, Integer> bookList = new HashMap();

        // Go through each user
        for (User userObject : userObjects) {
            for (int b = 0; b < userObject.books.length; b++) {

                String book;
                book = userObject.books[b];

                Integer value = bookList.get(book);
                if (value != null) {
                    bookList.put(book, bookList.get(book) + 1);
                } else {
                    bookList.put(book, 1);
                }
            }
        }

        Iterator iterator = bookList.keySet().iterator();

        while (iterator.hasNext()) {
            String key = iterator.next().toString();
            int value = bookList.get(key);

            if (value == 1)
                System.out.println("\"" + key + "\" has been bought " + value + " time.");
            else
                System.out.println("\"" + key + "\" has been bought " + value + " times.");
        }

    }

    private void instantiateUsers() {

        for(int i = 0; userObjects.length > i; i++) {
            userObjects[i] = new User(userIds[i], books[i]);
        }

    }

    private void getUserBookCount(){
        for (User userObject : userObjects) {
            System.out.println("User with id: " + userObject.userId + " has " + User.getBookCount(userObject) + " books.");
        }

    }

}
