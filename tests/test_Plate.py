"""
Test for the Plate Class
:author: ooemperor
"""
import unittest
from unittest import TestCase
from src.object.Plate import Plate

class TestPlate(TestCase):
    def test_material(self):
        """
        Test for the getter and setter of material of Nozzle
        :return: Nothing
        """
        plat = Plate("Copper")
        self.assertEqual("Copper", plat.material)
        plat.material = "Steel"
        self.assertEqual("Steel", plat.material)


    def test_toString(self):
        """
        Test for the toString Method of Plate
        :return: Nothing
        """
        plat = Plate("Copper")
        self.assertEqual("Plate with Material: Copper", plat.__str__())
        plat.material = "Steel"
        self.assertEqual("Plate with Material: Steel", plat.__str__())

