"""
Test for the Nozzle Class
:author: ooemperor
"""
import unittest
from unittest import TestCase
from src.object.Nozzle import Nozzle

class TestNozzle(TestCase):
    def test_material(self):
        """
        Test for the getter and setter of material of Nozzle
        :return: Nothing
        """
        noz = Nozzle("Copper")
        self.assertEqual("Copper", noz.material)
        noz.material = "Steel"
        self.assertEqual("Steel", noz.material)


    def test_toString(self):
        """
        Test for the toString Method of Nozzle
        :return: Nothing
        """
        noz = Nozzle("Copper")
        self.assertEqual("Nozzle with Material: Copper", noz.__str__())
        noz.material = "Steel"
        self.assertEqual("Nozzle with Material: Steel", noz.__str__())

