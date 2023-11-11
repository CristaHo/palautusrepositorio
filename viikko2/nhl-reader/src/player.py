class Player:
    def __init__(self, dict):
        self.name = dict['name']
        self.team = dict['team']
        self.goals = dict['goals']
        self.assists = dict['assists']
        self.nationality = dict['nationality']
        self.points = dict['goals']+dict['assists']

    def __str__(self):
        return f"{self.name:20} team {self.team} points {self.goals:4} + {self.assists} = {self.points}"
