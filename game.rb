class Game
	require_relative "player.rb"
    require_relative "board.rb"
    require_relative "boardcase.rb"

	attr_accessor :end_game

    def initialize
    	@player_1 = Player.new("Player 1", 'X') # Création Joueur 1 avec X
    	@player_2 = Player.new("Player 2", 'O') # Création Joueur 2 avec O
    	@current_player = @player_1 #current_player initaliser à Joueur1
    	@end_game = false # De base end_game est init a faux
      @board = Board.new #Création de la board vide => initialize
    end

    def switch_player
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
        # Fonction changement de joueur : Si le current_player == player1 alors on passe a player2 sinon c'est bien au tour de player1
    end

    def player_input # Méthode d'action de l'utilisateur choix entre 1 et 9
        @board.draw_board # Affichage board vide
        @board.draw_legend #Affichage règle de placement
        puts "A ton tour, #{@current_player.name}. Entre un numéro de 1 à 9."
        input = gets.chomp.to_i #Récupération du numéro
            until input.between?(1, 9) #Tant que le numéro n'est pas entre 1 et 10 on redemande.
            puts "Vous devez entrer un numéro entre 1 et 9 !"
            input = gets.chomp.to_i #On récupère à nouveau le numéro
            end
        input - 1 #Décrémentation pour être aligné avec le placement
    end

    def player_move #Méthode de mouvement du jouer
        move = player_input	#move = Numéro entré par le joueur
            until @board.cells[move].value == " "	 #Tant que le numéro n'est pas vide
            puts "La place est déja prise, retente ta chance"	#On recommence
            move = player_input
            end
        @board.cells[move].value = @current_player.symbol #On place le symbol du current_player 
        @current_player.taken_cells << move #
    end



    def check_end_game
        conditions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        conditions.each do |condition|
            if (condition - @current_player.taken_cells).empty?
                puts "#{@current_player.name} a gagné! Bravoo !"
                @end_game = true
            end
        end

				if @player_1.taken_cells.size + @player_2.taken_cells.size >= 10
					puts "Match nul, dommage !"
				@end_game = true
				end
        @end_game

    end

end

game = Game.new
puts "Il est l'heure de nous montrer ce que tu as dans le ventre"
puts"----------------------------------------------------------"

until game.check_end_game
  game.player_move
  game.check_end_game
  game.switch_player
end
