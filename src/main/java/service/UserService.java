package service;

import model.TSalary;
import model.TUser;

import java.util.List;

public interface UserService {
    /**
     *
     * @param userid
     * @return
     */
    public int deleteUser(Integer userid);

    /**
     * User login service method
     * @param username   user account for login
     * @param password   password for login
     * @return  TUser   successful return user object, otherwise return null
     */
    public TUser login(String username, String password);

    /**
     * Check whether the user account is available
     * @param username
     * @return boolean,If available, return true; if unavailable, return false
     */
    public boolean isUsernameValid(String username);

    /**
     * Registered users (including hotel administrators and ordinary members)
     * @param user TUser object containing user registration information
     * @return boolean,True is returned for successful and false for failed
     */
    public boolean registerUser(TUser user);

    /**
     * Modify user information
     * @param user TUser object containing user modification information
     * @return boolean,Return true for success and false for failure
     */
    public boolean modifyUser(TUser user);

    /**
     * Returns the user object of the specified username
     * @param userid  Userid to query
     * @return  The tuser object is returned successfully,
     * and null is returned in case of failure
     */
    public TUser getTUserByid(int userid);
    public List<TUser> getUsersSelective(TUser record);

    public List<TUser> getUsersSelectiveOr(TUser record);
}
