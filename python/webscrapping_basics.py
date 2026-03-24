#!/usr/bin/env python
# coding: utf-8

# In[1]:


from bs4 import BeautifulSoup
import requests


# In[2]:


url='https://www.scrapethissite.com/pages/forms/'


# In[4]:


page=requests.get(url)


# In[7]:


soup=BeautifulSoup(page.text,'html')


# In[9]:


print(soup.prettify())


# In[ ]:




