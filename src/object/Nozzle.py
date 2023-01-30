"""
Class for a Nozzle
:author: ooemperor
"""

class Nozzle:

    #instance variables
    __material = None

    def __init__(self, material):
        """
        The constructor for the nozzle
        :param material: the material the nozzle is made of
        """
        self.__material = material

    @property
    def material(self):
        """
        Getter for the material
        :return: the material the nozzle ist made of
        """
        return self.__material

    @material.setter
    def material(self, material):
        """
        Setter for the material
        :param material: The material of the nozzle
        :return: Nothing
        """
        self.__material = material

    def __str__(self):
        """
        toString Method of the Nozzle
        :return: the string representation of the nozzle
        """
        return f"Nozzle with Material: {self.__material}"