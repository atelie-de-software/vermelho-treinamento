class Game
  X_BOUNDARY = 4

  def initialize(pac_position_x = 2, pac_position_y = 2)
    @screen           = ""
    @pac_position_x   = pac_position_x
    @pac_position_y   = pac_position_y
    @wall_one         = [1,1]
    @wall_two         = [1,2]
    @wall_three       = [1,3]
    @wall_four        = [3,1]
    @wall_five        = [3,3]
    @ball_one         = [0,0]
    @ball_one_live    = true
    @ball_two         = [4,4]
    @ball_two_live    = true
    @ghost            = [4,0]
    @ghost_live       = false
    @tick_counter     = 0
    @win              = false
    @game_over        = false
  end

  def screen
    @screen == "" if render_screen
    @screen
  end

  def move(dx, dy)
    new_position_x  = @pac_position_x + dx
    new_position_y  = @pac_position_y + dy

    if ([new_position_x, new_position_y] != @wall_one &&
        [new_position_x, new_position_y] != @wall_two &&
        [new_position_x, new_position_y] != @wall_three &&
        [new_position_x, new_position_y] != @wall_four &&
        [new_position_x, new_position_y] != @wall_five
    )
      @pac_position_x = [[new_position_x, 0].max, 4].min
      @pac_position_y = [[new_position_y, 0].max, 4].min
    end

    render_screen
  end

  def up()      move(0, -1)   end
  def down()    move(0, 1)    end
  def left()    move(-1, 0)   end
  def right()   move(1, 0)    end

  def render_screen
    @screen    = ''

    @game_over = true if @ghost == [@pac_position_x, @pac_position_y]
    if @win
      @screen = 'Vitória!'
      return
    end

    5.times do |y|
      5.times do |x|
        @ball_one_live = false if @ball_one      == [@pac_position_x, @pac_position_y]
        @ball_two_live = false if @ball_two      == [@pac_position_x, @pac_position_y]
        @win           = true  if @ball_one_live == false && @ball_two_live == false

        if @game_over
          @screen = 'Game Over!'
        else
          if [[x,y]].include? [@pac_position_x, @pac_position_y]
            @screen += (check_x_boundaries(x) ? "c\n" : "c")
            next
          end

          if @wall_one == [x,y] || @wall_two == [x,y] || @wall_three == [x,y] || @wall_four == [x,y] || @wall_five == [x,y]
            @screen += (check_x_boundaries(x) ? "#\n" : "#")
            next
          end

          if @ball_one == [x,y] && @ball_one_live
            @screen += (check_x_boundaries(x) ? "*\n" : "*")
            next
          end

          if @ball_two == [x,y] && @ball_two_live
            @screen += (check_x_boundaries(x) ? "*\n" : "*")
            next
          end

          @ghost_live = true if @tick_counter == 5
          if @ghost == [x,y] && @ghost_live
            @screen += (check_x_boundaries(x) ? "f\n" : "f")
            next
          end
          @screen += " "
          @screen += "\n" if check_x_boundaries(x)
        end
      end
    end
  end

  def tick
    @tick_counter += 1
    move_ghost
  end

  def move_ghost
    ghost_axys if (@tick_counter % 2).zero? && @ghost_live
  end

  def ghost_axys
    module_x = (@ghost[0] - @pac_position_x).abs
    module_y = (@ghost[1] - @pac_position_y).abs
    return move_ghost_x_axys if module_x >= module_y

    move_ghost_y_axys
  end

  def move_ghost_x_axys
    @ghost[0] = @ghost[0] > @pac_position_x ? (@ghost[0] - 1) : (@ghost[0] + 1)
  end

  def move_ghost_y_axys
    @ghost[1] = @ghost[1] > @pac_position_y ? (@ghost[1] - 1) : (@ghost[1] + 1)
  end

  private

  def check_x_boundaries(x)
    x == X_BOUNDARY
  end
end
