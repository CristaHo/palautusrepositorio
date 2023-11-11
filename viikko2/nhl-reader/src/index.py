import requests
from player_reader import PlayerReader
from player_stats import PlayerStats

def main():
    
    url = "https://studies.cs.helsinki.fi/nhlstats/2022-23/players"
    reader = PlayerReader(url)
    get_dict = PlayerReader.get_project(reader)
    stats = PlayerStats(get_dict)
    players = stats.top_scorers_by_nationality("FIN")
    
    for player in players:
        print(player)


main()