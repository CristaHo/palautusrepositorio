
def sort_by_points(player):
    return player.points

class PlayerStats:
    def __init__(self, players):
        self.players = players
    
    def top_scorers_by_nationality(self, nationality):
        players_nationality = []
        for player in self.players:
            if player.nationality == nationality:
                players_nationality.append(player)
        
        

        sorted_players = sorted(
                players_nationality,
                reverse=True,
                key=sort_by_points
            )
        

        
        return sorted_players