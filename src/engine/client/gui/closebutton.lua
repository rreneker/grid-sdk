--========= Copyright © 2013-2015, Planimeter, All rights reserved. ==========--
--
-- Purpose: Close Button class
--
--============================================================================--

class "closebutton" ( gui.button )

closebutton.canFocus = false

function closebutton:closebutton( parent, name )
	gui.button.button( self, parent, name )
	self.width	= 2 * 36 + 8  - 1
	self.height = 2 * 36 + 16 - 2
	self.icon	= self:getScheme( "closebutton.icon" )
end

local round = math.round

function closebutton:draw()
	if ( not self:isVisible() ) then
		return
	end

	local property = "closebutton.iconColor"

	if ( self.mousedown and self.mouseover ) then
		property = "closebutton.mousedown.iconColor"
	elseif ( self.mousedown or self.mouseover or self.focus ) then
		property = "closebutton.mouseover.iconColor"
	end

	graphics.setColor( self:getScheme( property ) )

	local x = round( self:getWidth()  / 2 - self.icon:getWidth()  / 2 + 4 )
	local y = round( self:getHeight() / 2 - self.icon:getHeight() / 2 )
	graphics.draw( self.icon:getDrawable(), x, y )

	gui.panel.draw( self )
end

function closebutton:onClick()
	local parent = self:getParent()
	parent:close()
end

gui.register( closebutton, "closebutton" )
