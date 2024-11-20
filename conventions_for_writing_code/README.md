# Conventions used to write code

A collection of conventions and guides on how to write code consistent with existing repositories.

## Files

The filename has to be written in snake_case (lowercase and with *underscores* among different words)

Example: **test_class.cpp**

## Classes

The classes name should be the same as the file but in CamelCase (uppercase words)

Example: **TestClass**

Getter and setter method should be written in modern c++ style. In the examples `X` is the type, `x()` is the function and `x_` is the class variable.

* Using classic c++:
    1. **Setter**: `X&       x()        { return x_; }`
    2. **Getter**: `const X& x() const  { return x_; }`
        
* Otherwise, using modern trailing return function and auto: 
    1. **Setter**: `auto x()       -> X&       { return x_; }`
    2. **Getter**: `auto x() const -> const X& { return x_; }`

## Variables 
Variables should be written in lower camelCase: 

* Example: `myVariable`


Private variables should be written in camelCase and with an underscore at the end:

* Example: `myVariable_`






Variable that specifies frames in the name must be written according to the following convention:

1. If we want to define a variable that is express in the same frame, first it should be written the frame name following by underscore and then the variable name (with or without the underscore depending on whether the variable is private or public)
    * Example: `bodyF_x` or `bodyF_x_`

2. If we want to define a Rotation or a Transformation matrix from frame *body* to *world* b, it should be put first the *body frame* then the variable frame and finally the *world frame*. 
    * Example: `bodyF_R_worldF` or `bodyF_R_worldF_`

## Functions

Functions should be defined with the first letter and all the letters of a new word in uppercase and without underscore

* Example: `DoSomething()`

## Configuration Files

Ros has the parameter server to handle the possibility to pass parameters to a node. Since at the time we write this guide, there is no way to dynamical reconfigure the parameters, we choose to use **libconfig.c++** library to avoid this drawback. All the configuration files have to been written and parsed following the libconfig structure. 

For detailed information: [libconfig++](https://www.hyperrealm.com/libconfig/libconfig_manual.html)


