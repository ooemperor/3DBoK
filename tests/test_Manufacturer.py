"""
Test for the Manufacturer Class
:author: ooemperor
"""
import unittest
from unittest import TestCase
from src.object.Manufacturer import Manufacturer


class TestName(TestCase):
    def test_Name(self):
        man = Manufacturer("Creality", "www.creality.com")
        self.assertEqual("Creality", man.name)
        self.assertEqual("www.creality.com", man.url)
        man.name = "Not Creality"
        self.assertEqual("Not Creality", man.name)

    def test_Url(self):
        man = Manufacturer("Creality", "www.creality.com")
        self.assertEqual("Creality", man.name)
        self.assertEqual("www.creality.com", man.url)
        man.url = "www.google.ch"
        self.assertEqual("www.google.ch", man.url)

    def test_ToString(self):
        man = Manufacturer("Creality", "www.creality.com")
        self.assertEqual("Creality", man.name)
        self.assertEqual("www.creality.com", man.url)
        self.assertEqual("Manufacturer: Creality with url: www.creality.com", man.__str__())


if __name__ == '__main__':
    unittest.main()
