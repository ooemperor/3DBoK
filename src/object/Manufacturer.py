"""
Class for a Manufacturer
:author: ooemperor
"""


class Manufacturer:

    #instance variables
    __name = None
    __url = None

    def __init__(self, name, url):
        """
        The constructor for a Manufacturer
        :param name: the name of the Manufacturer
        :param url:
        :return: nothing
        """
        self.__name = name
        self.__url = url

    @property
    def name(self):
        """
        Property for name
        :return: name of the manufacturer
        """
        return self.__name

    @name.setter
    def name(self, name):
        """
        setter for the name of the manufacturer
        :param name: The name to set
        :return: Nothing
        """
        self.__name = name

    @property
    def url(self):
        """
        Geter for the url
        :return: the url of the manufacturer
        """
        return self.__url

    @url.setter
    def url(self, url):
        """
        setter for the url of the manufacturer
        :param url: the url to set
        :return: nothing
        """
        self.__url = url

    def __str__(self):
        """
        toString method for a object
        :return: String representing the Manufacturer
        """
        return f"Manufacturer: {self.__name} with url: {self.__url}"

