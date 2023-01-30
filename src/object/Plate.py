"""
Class for the Plate of a 3d printer
:author: ooemperor
"""

class Plate:
    #instance variables
    __material = None

    def __init__(self, material):
        """
        The constructor for the plate
        :param material: the material the nozzle is made of
        """
        self.__material = material

    @property
    def material(self):
        """
        Getter for the material
        :return: the material the plate ist made of
        """
        return self.__material

    @material.setter
    def material(self, material):
        """
        Setter for the material
        :param material: The material of the plate
        :return: Nothing
        """
        self.__material = material

    def __str__(self):
        """
        toString Method of the plate
        :return: the string representation of the plate
        """
        return f"Plate with Material: {self.__material}"