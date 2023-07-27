# frozen_string_literal: true

# Responsável pela distribuição de pontos de habilidade dos personagens de acordo com o aumento de level.
#
#
# Each level gives 3 points of hability_points
#
# 190 levels x 3 pts = 570 hability_points
#
# Habilidades: strength tenacity devotion wisdom: Aceitam ao máximo 500 pontos cada habilidade.
# do not change this file
module UserCharacters
  module UpgradeOrDowngradeHabilityPower
    extend ActiveSupport::Concern
    included do
      private

      # Verify hability changes
      def has_hability_points_changes?
        will_save_change_to_strength? || will_save_change_to_wisdom? || will_save_change_to_devotion? || will_save_change_to_tenacity?
      end

      ##################################
      # Upgrade or Downgrade Habilitys #
      ##################################
      def upgrade_or_downgrade_hability_power
        hability_who_was_changed = if will_save_change_to_strength?
                                     :strength
                                   elsif will_save_change_to_wisdom?
                                     :wisdom
                                   elsif will_save_change_to_devotion?
                                     :devotion
                                   else
                                     :tenacity
                                   end

        case hability_who_was_changed
        # STR #
        when :strength
          if strength > strength_in_database

            amount_of_hability_points = strength - strength_in_database
            upgrade_or_downgrade_strength(amount_of_hability_points, :upgrade)
          else
            amount_of_hability_points = strength_in_database - strength
            upgrade_or_downgrade_strength(amount_of_hability_points, :downgrade)
          end

        # WIS #
        when :wisdom
          if wisdom > wisdom_in_database
            amount_of_hability_points = wisdom - wisdom_in_database
            upgrade_or_downgrade_wisdom(amount_of_hability_points, :upgrade)
          else
            amount_of_hability_points = wisdom_in_database - wisdom
            upgrade_or_downgrade_wisdom(amount_of_hability_points, :downgrade)
          end

        # DEV #
        when :devotion
          if devotion > devotion_in_database
            amount_of_hability_points = devotion - devotion_in_database
            upgrade_or_downgrade_devotion(amount_of_hability_points, :upgrade)
          else
            amount_of_hability_points = devotion_in_database - devotion
            upgrade_or_downgrade_devotion(amount_of_hability_points, :downgrade)
          end

        # TEN #
        else :tenacity
             if tenacity > tenacity_in_database
               amount_of_hability_points = tenacity - tenacity_in_database
               upgrade_or_downgrade_tenacity(amount_of_hability_points, :upgrade)
             else
               amount_of_hability_points = tenacity_in_database - tenacity
               upgrade_or_downgrade_tenacity(amount_of_hability_points, :downgrade)
             end
        end
      end

      def upgrade_or_downgrade_strength(amount_of_hability_points, action)
        temp_ataque        = (strength_properties[:ataque] * amount_of_hability_points)
        temp_ataque_magico = (strength_properties[:ataque_magico] * amount_of_hability_points)
        temp_defesa        = (strength_properties[:defesa] * amount_of_hability_points)
        temp_precisao      = (strength_properties[:precisao] * amount_of_hability_points)
        temp_evasao        = (strength_properties[:evasao] * amount_of_hability_points)

        if action == :upgrade
          self.ataque          += temp_ataque
          self.ataque_magico   += temp_ataque_magico
          self.defesa          += temp_defesa
          self.precisao        += temp_precisao
          self.evasao          += temp_evasao

          self.strength        += amount_of_hability_points
          self.hability_points -= amount_of_hability_points
        else
          self.ataque          -= temp_ataque
          self.ataque_magico   -= temp_ataque_magico
          self.defesa          -= temp_defesa
          self.precisao        -= temp_precisao
          self.evasao          -= temp_evasao

          self.strength        -= amount_of_hability_points
          self.hability_points += amount_of_hability_points
        end
      end

      def upgrade_or_downgrade_tenacity(amount_of_hability_points, action)
        temp_ataque        = (tenacity_properties[:ataque] * amount_of_hability_points)
        temp_ataque_magico = (tenacity_properties[:ataque_magico] * amount_of_hability_points)
        temp_defesa        = (tenacity_properties[:defesa] * amount_of_hability_points)
        temp_precisao      = (tenacity_properties[:precisao] * amount_of_hability_points)
        temp_evasao        = (tenacity_properties[:evasao] * amount_of_hability_points)

        if action == :upgrade
          self.ataque          += temp_ataque
          self.ataque_magico   += temp_ataque_magico
          self.defesa          += temp_defesa
          self.precisao        += temp_precisao
          self.evasao          += temp_evasao

          self.tenacity        += amount_of_hability_points
          self.hability_points -= amount_of_hability_points
        else
          self.ataque          -= temp_ataque
          self.ataque_magico   -= temp_ataque_magico
          self.defesa          -= temp_defesa
          self.precisao        -= temp_precisao
          self.evasao          -= temp_evasao

          self.tenacity        -= amount_of_hability_points
          self.hability_points += amount_of_hability_points
        end
      end

      def upgrade_or_downgrade_devotion(amount_of_hability_points, action)
        temp_ataque_magico = (devotion_properties[:ataque_magico] * amount_of_hability_points)
        temp_ataque        = (devotion_properties[:ataque] * amount_of_hability_points)
        temp_defesa        = (devotion_properties[:defesa] * amount_of_hability_points)
        temp_precisao      = (devotion_properties[:precisao] * amount_of_hability_points)
        temp_evasao        = (devotion_properties[:evasao] * amount_of_hability_points)

        if action == :upgrade
          self.ataque          += temp_ataque
          self.ataque_magico   += temp_ataque_magico
          self.defesa          += temp_defesa
          self.precisao        += temp_precisao
          self.evasao          += temp_evasao

          self.devotion        += amount_of_hability_points
          self.hability_points -= amount_of_hability_points
        else
          self.ataque          -= temp_ataque
          self.ataque_magico   -= temp_ataque_magico
          self.defesa          -= temp_defesa
          self.precisao        -= temp_precisao
          self.evasao          -= temp_evasao

          self.devotion        -= amount_of_hability_points
          self.hability_points += amount_of_hability_points
        end
      end

      def upgrade_or_downgrade_wisdom(amount_of_hability_points, action)
        temp_ataque_magico = (wisdom_properties[:ataque_magico] * amount_of_hability_points)
        temp_ataque        = (wisdom_properties[:ataque] * amount_of_hability_points)
        temp_defesa        = (wisdom_properties[:defesa] * amount_of_hability_points)
        temp_precisao      = (wisdom_properties[:precisao] * amount_of_hability_points)
        temp_evasao        = (wisdom_properties[:evasao] * amount_of_hability_points)

        if action == :upgrade
          self.ataque          += temp_ataque
          self.ataque_magico   += temp_ataque_magico
          self.defesa          += temp_defesa
          self.precisao        += temp_precisao
          self.evasao          += temp_evasao

          self.wisdom          += amount_of_hability_points
          self.hability_points -= amount_of_hability_points
        else
          self.ataque          -= temp_ataque
          self.ataque_magico   -= temp_ataque_magico
          self.defesa          -= temp_defesa
          self.precisao        -= temp_precisao
          self.evasao          -= temp_evasao

          self.wisdom          -= amount_of_hability_points
          self.hability_points += amount_of_hability_points
        end
      end

      ###########################
      # Basic Characters Struct #
      ###########################
      def strength_properties
        {
          ataque: BigDecimal('2.00'),
          ataque_magico: BigDecimal('0.80'),
          defesa: BigDecimal('1.50'),
          precisao: BigDecimal('0.10'),
          evasao: BigDecimal('0.08')
        }
      end

      def tenacity_properties
        {
          ataque: BigDecimal('1.50'),
          ataque_magico: BigDecimal('0.70'),
          defesa: BigDecimal('2.00'),
          precisao: BigDecimal('0.09'),
          evasao: BigDecimal('0.09')
        }
      end

      def devotion_properties
        {
          ataque_magico: BigDecimal('2.25'),
          ataque: BigDecimal('0.80'),
          defesa: BigDecimal('1.25'),
          precisao: BigDecimal('0.08'),
          evasao: BigDecimal('0.10')
        }
      end

      def wisdom_properties
        {
          ataque_magico: BigDecimal('1.50'),
          ataque: BigDecimal('0.70'),
          defesa: BigDecimal('2.00'),
          precisao: BigDecimal('0.09'),
          evasao: BigDecimal('0.09')
        }
      end
    end
  end
end
