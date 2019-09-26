class Game
  X_BOUNDARY = 4

  def initialize(pac_position_x = 2, pac_position_y = 2)
    @screen           = ""
    @pac_position_x   = pac_position_x
    @pac_position_y   = pac_position_y
    @ball_one         = [0,0]
    @ball_one_live    = true
    @ball_two         = [4,4]
    @ball_two_live    = true
    @ghost            = [4,0]
    @ghost_live       = false
    @tick_counter     = 0
  end

  def screen
    @screen == "" if render_screen
    @screen
  end

  def move(dx, dy)
    @pac_position_x = [[@pac_position_x + dx, 0].max, 4].min
    @pac_position_y = [[@pac_position_y + dy, 0].max, 4].min
    render_screen
  end

  def up()      move(0, -1)   end

  def down()    move(0, 1)    end

  def left()    move(-1, 0)   end

  def right()   move(1, 0)    end

  def render_screen
    @screen = ""

    5.times do |y|
      5.times do |x|
        if [[x,y]].include? [@pac_position_x, @pac_position_y]
          @screen += (check_x_boundaries(x) ? "c\n" : "c")
          next
        end

        @ball_one_live = false if @ball_one == [@pac_position_x, @pac_position_y]
        @ball_two_live = false if @ball_two == [@pac_position_x, @pac_position_y]

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
