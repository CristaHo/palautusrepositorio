import unittest
from statistics_service import StatisticsService, SortBy
from player import Player

class PlayerReaderStub:
    def get_players(self):
        return [
            Player("Semenko", "EDM", 4, 12),
            Player("Lemieux", "PIT", 45, 54),
            Player("Kurri", "EDM", 37, 53),
            Player("Yzerman", "DET", 42, 56),
            Player("Gretzky", "EDM", 35, 89)
        ]

class TestStatisticsService(unittest.TestCase):
    def setUp(self):
        # annetaan StatisticsService-luokan oliolle "stub"-luokan olio
        self.stats = StatisticsService(
            PlayerReaderStub()
        )

    def test_search_player(self):
        self.assertAlmostEqual(self.stats.search("Kurri").name, "Kurri")
    
    def test_search_player_not_found(self):
        self.assertAlmostEqual(self.stats.search("Lassi"), None)
    
    def test_find_team(self):
        players = self.stats.team("PIT")
    
        self.assertAlmostEqual(players[0].name, "Lemieux")
    
    def test_top_list(self):
        top_players = self.stats.top(2)
       
        self.assertAlmostEqual([top_players[0].name, top_players[1].name], ["Gretzky", "Lemieux"])
        
    def test_top_points(self):
        top_players = self.stats.top(3, SortBy.POINTS)
        
        self.assertAlmostEqual([top_players[0].name, top_players[1].name, top_players[2].name], ["Gretzky", "Lemieux", "Yzerman"])
    
    def test_top_goals(self):
        top_players = self.stats.top(3, SortBy.GOALS)
        
        self.assertAlmostEqual([top_players[0].name, top_players[1].name, top_players[2].name], ["Lemieux", "Yzerman", "Kurri"])
    
    def test_top_assists(self):
        top_players = self.stats.top(3, SortBy.ASSISTS)
        
        self.assertAlmostEqual([top_players[0].name, top_players[1].name, top_players[2].name], ["Gretzky", "Yzerman", "Lemieux"])
        
        
