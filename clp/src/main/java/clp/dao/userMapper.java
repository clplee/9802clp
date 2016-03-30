package clp.dao;



import java.util.List;

import org.apache.catalina.filters.AddDefaultCharsetFilter;

import clp.model.user;

public interface userMapper {
user getByPrimaryKey(Integer id);
List<user> getAll();
List<user> getAll2();
List<user> getAll3();
void addUser(user user);
void deleteUser(Integer id);
void updateUser(user user);
}
