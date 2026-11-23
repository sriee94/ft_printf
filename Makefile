# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sariee <sariee@student.s19.be>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/23 11:27:27 by sariee            #+#    #+#              #
#    Updated: 2025/12/13 19:25:48 by sariee           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC			=	ft_printf.c	\
				ft_printf_putchar.c	\
				ft_printf_numbers.c	\
				ft_printf_pointer.c	\
				ft_printf_hex.c	

BONUS		=	

NAME		= libftprintf.a
CC			= cc
CFLAGS		= -Wall -Wextra -Werror
AR			= ar rc
RM			= rm -f
MKDIR		= mkdir -p

OBJ_DIR		= objs
BONUS_DIR	= bonus_objs

OBJS		= $(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))
OBJS_BONUS	= $(addprefix $(BONUS_DIR)/, $(notdir $(BONUS:.c=.o)))

GREEN		= \033[0;32m
RESET		= \033[0m

all: $(NAME)

$(NAME): $(OBJS)
	@$(AR) $(NAME) $(OBJS)
	@printf "$(GREEN)✓ ft_printf s'est compilée correctement.$(RESET)\n"
bonus: $(OBJS) $(OBJS_BONUS)
	@$(AR) $(NAME) $(OBJS) $(OBJS_BONUS)
	@printf "$(GREEN)✓ Tous les objets bonus se sont bien compilés.$(RESET)\n"
$(OBJ_DIR)/%.o: %.c
	@$(MKDIR) $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

$(BONUS_DIR)/%.o: bonus/%.c
	@$(MKDIR) $(BONUS_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@$(RM) -r $(OBJ_DIR) $(BONUS_DIR)
	@printf "$(GREEN)✓ Tous les objets ont bien été supprimés.$(RESET)\n"
fclean: clean
	@$(RM) $(NAME)
	@printf "$(GREEN)✓ Nettoyage complet effectué !$(RESET)\n"
re: fclean all

.PHONY: all clean fclean re bonus
