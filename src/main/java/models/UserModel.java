package models;

import beans.User;
import org.sql2o.Connection;
import utils.DbUtils;

import java.util.List;
import java.util.Optional;

public class UserModel {
    public static Optional<User> findByUserName(String username) {
        final String sql = "select * from users where username = :username";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(sql)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return Optional.empty();
            }

            return Optional.ofNullable(list.get(0));
        }
    }

    public static Optional<User> findByEmail(String email) {
        final String sql = "select * from users where email = :email";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(sql)
                    .addParameter("email", email)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return Optional.empty();
            }

            return Optional.ofNullable(list.get(0));
        }
    }


    public static void add(User user) {
        final String sql = "INSERT INTO users (username, password, name, email, dob, permission) VALUES (:username,:password,:name,:email,:dob,:permission)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("username", user.getUsername())
                    .addParameter("password", user.getPassword())
                    .addParameter("name", user.getName())
                    .addParameter("email", user.getEmail())
                    .addParameter("dob", user.getDob())
                    .addParameter("permission", user.getPermission())
                    .executeUpdate();
        }
    }

    public static void Update(User c) {
        final String sql = "update users set name = :name, email=:email, password =: password where id = :UserID";
        try(Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("name", c.getName())
                    .addParameter("email", c.getEmail())
                    .addParameter("password", c.getPassword())
                    .addParameter("UserID", c.getId())
                    .executeUpdate();
        }

    }
}
