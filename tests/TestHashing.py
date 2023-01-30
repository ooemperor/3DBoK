import unittest
from src import Hashing as h

class TestHashing(unittest.TestCase):
    def testHash(self):
        self.assertEqual("41d8dfd0e347fc4b89845e23ed90f8a58b3543fbb3aa5ef68c854ae6a94da1ca", h.hash("mkaiser"))  # add assertion here


if __name__ == '__main__':
    unittest.main()
