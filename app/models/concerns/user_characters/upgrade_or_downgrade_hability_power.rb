# frozen_string_literal: true

# refatorar !, status: non-tested-yet

## Atualiza as habilidades do personagem de acordo com os pontos de habilidade distribuídos/escolhidos.
# Quando o jogador distribuir seus pontos.

module UserCharacters
  module UpgradeOrDowngradeHabilityPower
    extend ActiveSupport::Concern
    included do
      private

      def upgrade_or_downgrade_hability_power
        hability_who_was_changed = if strength_has_changes_to_save?
                                     :strength
                                   elsif wisdom_has_changes_to_save?
                                     :wisdom
                                   elsif devotion_has_changes_to_save?
                                     :devotion
                                   elsif tenacity_has_changes_to_save?
                                     :tenacity
                                   else
                                     return
                                   end

        case hability_who_was_changed
        when :strength
          if strength > strength_in_database
            amount_of_points_assigned = strength - strength_in_database
            upgrade_strength(amount_of_points_assigned)
            hability_points -= amount_of_points_assigned
          else
            amount_of_points_removed = strength_in_database - strength
            donwgrade_strength(amount_of_points_removed)
            hability_points += amount_of_points_removed
          end
        when :wisdom
          if wisdom > wisdom_in_database
            amount_of_points_assigned = wisdom - wisdom_in_database
            upgrade_wisdom(amount_of_points_assigned)
            hability_points -= amount_of_points_assigned
          else
            amount_of_points_removed = wisdom_in_database - wisdom
            donwgrade_wisdom(amount_of_points_removed)
            hability_points += amount_of_points_removed
          end
        when :devotion
          if devotion > devotion_in_database
            amount_of_points_assigned = devotion - devotion_in_database
            upgrade_devotion(amount_of_points_assigned)
            hability_points -= amount_of_points_assigned
          else
            amount_of_points_removed = devotion_in_database - devotion
            donwgrade_devotion(amount_of_points_removed)
            hability_points += amount_of_points_removed
          end
        else :tenacity
          if tenacity > tenacity_in_database
            amount_of_points_assigned = tenacity - tenacity_in_database
            upgrade_tenacity(amount_of_points_assigned)
            hability_points -= amount_of_points_assigned
          else
            amount_of_points_removed = tenacity_in_database - tenacity
            donwgrade_tenacity(amount_of_points_removed)
            hability_points += amount_of_points_removed
          end
        end
      end

      def strength_properties
        {
          ataque: BigDecimal('2.00'),
          defesa: BigDecimal('1.25'),
          precisao: BigDecimal('0.11'),
          evasao: BigDecimal('0.07')
        }
      end

      def tenacity_properties
        {
          ataque: BigDecimal('1.25'),
          defesa: BigDecimal('2.00'),
          precisao: BigDecimal('0.07'),
          evasao: BigDecimal('0.11')
        }
      end

      def devotion_properties
        {
          ataque_magico: BigDecimal('2.25'),
          defesa: BigDecimal('1.00'),
          precisao: BigDecimal('0.07'),
          evasao: BigDecimal('0.11')
        }
      end

      def wisdom_properties
        {
          ataque_magico: BigDecimal('1.25'),
          defesa: BigDecimal('2.00'),
          precisao: BigDecimal('0.11'),
          evasao: BigDecimal('0.07')
        }
      end

      def upgrade_strength(amount_of_points_assigned)
        ataque   += (strength_properties[:ataque] * amount_of_points_assigned)
        defesa   += (strength_properties[:defesa] * amount_of_points_assigned)
        precisao += (strength_properties[:precisao] * amount_of_points_assigned)
        evasao   += (strength_properties[:evasao] * amount_of_points_assigned)
      end

      def donwgrade_strength(amount_of_points_removed)
        ataque   -= (strength_properties[:ataque] * amount_of_points_removed)
        defesa   -= (strength_properties[:defesa] * amount_of_points_removed)
        precisao -= (strength_properties[:precisao] * amount_of_points_removed)
        evasao   -= (strength_properties[:evasao] * amount_of_points_removed)
      end

      def upgrade_tenacity(amount_of_points_assigned)
        ataque   += (tenacity_properties[:ataque] * amount_of_points_assigned)
        defesa   += (tenacity_properties[:defesa] * amount_of_points_assigned)
        precisao += (tenacity_properties[:precisao] * amount_of_points_assigned)
        evasao   += (tenacity_properties[:evasao] * amount_of_points_assigned)
      end

      def donwgrade_tenacity(amount_of_points_removed)
        ataque   -= (tenacity_properties[:ataque] * amount_of_points_removed)
        defesa   -= (tenacity_properties[:defesa] * amount_of_points_removed)
        precisao -= (tenacity_properties[:precisao] * amount_of_points_removed)
        evasao   -= (tenacity_properties[:evasao] * amount_of_points_removed)
      end

      def upgrade_wisdom(amount_of_points_assigned)
        ataque_magico += (tenacity_properties[:ataque_magico] * amount_of_points_assigned)
        defesa        += (tenacity_properties[:defesa] * amount_of_points_assigned)
        precisao      += (tenacity_properties[:precisao] * amount_of_points_assigned)
        evasao        += (tenacity_properties[:evasao] * amount_of_points_assigned)
      end

      def donwgrade_wisdom(amount_of_points_removed)
        ataque_magico -= (wisdom_properties[:ataque_magico] * amount_of_points_removed)
        defesa        -= (wisdom_properties[:defesa] * amount_of_points_removed)
        precisao      -= (wisdom_properties[:precisao] * amount_of_points_removed)
        evasao        -= (wisdom_properties[:evasao] * amount_of_points_removed)
      end
    end
  end
end
