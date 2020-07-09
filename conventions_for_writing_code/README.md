# Conventions used to write code

A collection of conventions and guides on how to write code consistent with existing repositories.

## Files

* The filename has to be written in lowercase and with *underscores* among different words

  * __Example__: test_file.cpp

## Classes

* Also the classes name should be written as the file name 

  * __Example__: foo.cpp

Getter and setter method should be written in modern c++ style.

* If the return type can be modify be reference:

  1. **Setter**: auto X() -> type& { return x_; }
  
  2. **Getter**: auto X() const -> const type& { return x_ ; }
 
* Otherwise: 

  1. **Setter**: auto X(tyoe x) -> type { x_ =  x; }
  
  2. **Getter**: auto X() const -> type { return x_; }

## Variables 

* Private variable should be written with lowercase  and with an underscore at the end

  * __Example__: x_


* Public variable should be written as private ones but without the end underscore


  * __Example__: x

* Variable that specifies frames in the name must be written according to the following convention: 

  1. If we want to define a variable that is express in the same frame, first it should be written the frame name following by underscore and then the variable name (with or without the underscore depending on whether the variable is private or public)

   * __Example__: bodyF_x or bodyF_x_
   

  2. If we want to define a Rotation or a Transformation matrix from frame *body* to *world* b, it should be put first the *body frame* then the variable frame and finally the *world frame*. 

   * __Example__: bodyF_R_worldF or   bodyF_R_worldF_

## Funtions

* Functions should be defined with the first letter and all the letters of a new word in uppercase and without underscore

  * __Example__: DoSomething()

## Configuration Files

Ros has the parameter server to handle the possibility to pass parameters to a node. Since at the time we write this guide, there is no way to dynamical reconfigure the parameters, we choose to use **libconfig.c++** library to avoid this drawback. All the configuration files have to been written and parsed following the libconfig structure. 

For detailed information: [libconfig++](https://www.hyperrealm.com/libconfig/libconfig_manual.html)


