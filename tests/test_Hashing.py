"""
Tests for the Hashing file
:author:ooemperor
"""
import unittest
from src import Hashing


class TestHashing(unittest.TestCase):

    def test_Hash(self):
        """
        Testing that the hash is correct as expected
        :return: Nothing.
        """
        self.assertEqual("3e8ba732dd1215b4228fd82ee87ea1a07b18d71c71ffbd8e3e603ea40e551feb",
                         Hashing.hash("ooemperor"))

    def test_MultipleTimes(self):
        """
        Testing that multiple hashs do give the identical value
        :return: Nothing
        """
        self.assertEqual(Hashing.hash("ooemperor"), Hashing.hash("ooemperor"), Hashing.hash("ooemperor"))


if __name__ == '__main__':
    unittest.main()
