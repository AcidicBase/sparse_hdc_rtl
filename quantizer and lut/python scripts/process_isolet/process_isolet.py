#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np


# In[37]:


isolet = pd.read_csv("isolet_dataset/isolet1+2+3+4.csv", header=None)
train_X = isolet[list(range(0,617))]
train_y = isolet[617]

isolet_test = pd.read_csv("isolet_dataset/isolet5.csv", header=None)
test_X = isolet_test[list(range(0, 617))]
test_y = isolet_test[617]


# In[18]:


def unsigned_int_to_binary(int_num, bit_length=16):
    return ('{' + '0:0{}b'.format(bit_length) + '}').format(int_num)

def twos_compliment(binary):
    first_one_found = False
    result = ""
    for i in range(len(binary)-1,-1,-1):
        if not first_one_found and binary[i] == '1':
            first_one_found = True
            result = binary[i] + result
            continue
        
        if first_one_found:
            if binary[i] == '1':
                result  = '0' + result
            else:
                result = '1' + result
        else:
            result = binary[i] + result
    
    return result

def signed_int_to_binary(int_num):
    if int_num > 0:
        return unsigned_int_to_binary(int_num)
    else:
        return twos_compliment(unsigned_int_to_binary(int_num))


# In[4]:


# Convert Training X to 16 bit binary MEM file

for i in range(0, len(train_X)):
    converted_sample = np.vectorize(signed_int_to_binary)((train_X.iloc[i]*10000).astype(int))
    f = open("converted_samples/sample_{}.mem".format(i), "w+")

    for x in range(0, len(converted_sample)):
        f.write(converted_sample[x])
        if(x<len(converted_sample)-1):
            f.write("\n")

    f.close()


# In[43]:


# Convert Training Y to 5 bit binary MEM file

f = open("train_Y.mem", "w+")

for i in range(0, len(train_y)):
    converted_sample = unsigned_int_to_binary(int(train_y[i]), 5)
    f.write(converted_sample)
    if(i<len(train_y)-1):
        f.write("\n")
        
f.close()


# In[42]:


# Convert Test X to 16 bit binary MEM file

for i in range(0, len(test_X)):
    converted_sample = np.vectorize(signed_int_to_binary)((test_X.iloc[i]*10000).astype(int))
    f = open("converted_samples_test/test_sample_{}.mem".format(i), "w+")
    
    for x in range(0, len(converted_sample)):
        f.write(converted_sample[x])
        if(x<len(converted_sample)-1):
            f.write("\n")
            
    f.close()


# In[45]:


# Convert Test Y to 5 bit binary MEM file

f = open("test_Y.mem", "w+")

for i in range(0, len(test_y)):
    converted_sample = unsigned_int_to_binary(int(test_y[i]), 5)
    f.write(converted_sample)
    if(i<len(test_y)-1):
        f.write("\n")
        
f.close()

