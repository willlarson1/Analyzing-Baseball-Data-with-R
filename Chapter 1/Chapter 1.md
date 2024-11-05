**Chapter 1: The Baseball Datasets**

This chapter gives an overview of key baseball data sets that will be used throughout the book.

**Notes**

[Overview of Data Sets]{.underline}

1.  Lahman Database: Used for season-by-season statistics for players and teams. The following are the primary tables that are relevant, but more exist:
    1.  People table: Registry of MLB players and manager and basic information about the player (including their playerID).
    2.  Batting table: Season-by-season batting statistics for individual players, from 1871 until present day. Players are identified by their playerID.
    3.  Pitching table: Season-by-season pitching statistics for individual players.
    4.  Fielding table: Season-by-season fielding statistics for individual players.
    5.  Teams table: Season-by-season team statistics from 1871 until present day. Includes cumulative batting, pitching, and fielding statistics for the team's season.\
2.  Retrosheet Game-by-Game Data: Used for game-by-game data going back to 1871. Includes all relevant data about a game, from general information (date, time, duration) to player-specific box scores\
3.  Retrosheet Play-by-Play Data: Includes information for every play to occur since 1913. Difficult to work with, Appendix A of the book contains R code to extract and parse the data.\
4.  MLBAM Gameday and PITCHf/x: Pitch-by-pitch data for games since 2008. Includes pitch type, location, movement, spin, and more. Has since been superseded by Statcast.\
5.  Statcast: Tracks the movement of all players and the baseball during a game. Also includes "off-the-bat" data, like exit velocity and launch angle. Available through the Baseball Savant website. The "baseballr" package allows you to download this through R code.

**Exercises**

1.  Which Datafile?

    a.  The Lahman database is the best source to analyze the rate of walks per team over the history of baseball. The Teams table contains seasonal pitching data (including walks) since 1871.
    b.  Retrosheet's game-by-game data is the best source to analyze games in the 1968 and 2012 seasons.
    c.  Retrosheet's event files can be parsed to determine the percentage of first-pitch strikes, and the rate of strikes in any count. The "PITCH_SEQ_TX" field lists the pitching sequence of every at bat.
    d.  Baseball Savant's off-the-bat data is the best to analyze which players are the most likely to hit ground balls. The "launch_angle" field can determine if batted balls are grounders (a negative value), and the "launch_speed" field can be used to analyze the speed at which they are hit.
    e.  Retrosheet's event files can determine the rate of stolen bases by base. There are fields in the event logs (CS% and SB%) that notate when a runner steals or is caught stealing a base.\

2.  Lahman Pitching Data

    a.  Gibson completed 28/34 games that he started
    b.  Gibson had a 268:62 strikeout to walk ratio in 1968 (4.32:1)
    c.  Gibson pitched 304.2 innings in 1968
    d.  (198 hits + 62 walks)/304.6666... innings = 0.85 WHIP\

3.  Retrosheet Game Log

    a.  The game lasted 2 hours and 19 minutes (139 min)
    b.  The attendance info may have been unavailable for this particular game
    c.  3 - 2 doubles and 1 home run
    d.  12 times on base out of 36 plate appearances - .333 OBP\

4.  Retrosheet Play-by-Play Record

    The inning begins with a single to the right fielder on a line drive. The second batter also singles on a ground ball to the third baseman, who threw the ball to the shortstop. The runner on first base advances to second. The third batter lines into a triple play, on a line drive to the second baseman. The second baseman then tagged second base and doubled the runner off of first base, unassisted.\

5.  The knuckleball was slower than the fastball, starting at a speed of 73mph compared to 81.2. The knuckleball moved far less in horizontal direction (left by .64 inches, compared to left by nearly 5 inches) but a similar amount in the vertical direction. Finally, the knuckleball was located close to the center of the strike zone, whereas the fastball was located in the upper left corner. A knuckleball is difficult to hit due to its unpredictable movement and slow speeds, evidenced here.
