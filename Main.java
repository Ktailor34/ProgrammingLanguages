
import java.util.ArrayList;
import java.util.Scanner;
import javax.print.attribute.SetOfIntegerSyntax;
import jdk.jfr.SettingDescriptor;

public class Main {
    public static void main(String[] args) {
        Knoxagotchi Stalepet = new Knoxagotchi(1.0f,1.0f,1,"Blountasaurus"); // Should be... Knoxagotchi 
		Knoxagotchi pet = new kishan(2, 1.0f, 1.0f, 1, "KishanSpecies");

        ArrayList<Action> actions = new ArrayList<Action>();
        actions.add(new Eat());
        actions.add(new Exercise());
		actions.add(new levelUp());
        // Your own action!

        String input;
        Scanner scan = new Scanner(System.in);

        System.out.println("#############################");
        System.out.println("Welcome to Knoxagotchi. Your pet is a " + pet.species + ".");
        do {
            // Print options.
            System.out.println("\nEnter one of the following commands:\n");
            for(Action action : actions) {
                System.out.println(action.getCommand() + " --- " + action.getMenuMessage());
            }
            System.out.println("QUIT --- Quit the game.\n");

            // Perform specified action.
            input = scan.next().toUpperCase().trim();
            boolean didAction = false;
            for(Action action : actions) {
                if(input.equals(action.getCommand())) {
                    System.out.println(action.doAction(pet));
                    didAction = true;
                    break;
                }
            }
            if(didAction == false && !input.equals("QUIT")) {
                System.out.println("Invalid action. Try again.");
            }
        } while(!input.equals("QUIT"));
        scan.close();
    }
}

class Knoxagotchi {
	
	protected float happiness;
    protected float hunger;
	protected int level;
	protected String species;

	Knoxagotchi(float happiness, float hunger, int level, String species) {
		this.happiness = happiness;
		this.hunger = hunger;
		this.level = level;
		this.species = species;
	}

	int getLevel(){
		return level;
	}

	float getHunger() {
		return hunger;
	}

	float getHappiness() {
		return happiness;
	}

	String getSpecies() {
		return species;
	}

	void setLevel(int set){
		this.level = set;
	}

	void setHunger(float set) {
		this.hunger = set;
	}

	void setHappiness(float set) {
		this.happiness = set;
	}

	void setSpecies(String set) {
		this.species = set;
	}
   

}

class kishan extends Knoxagotchi {
	public kishan (int value, float happiness, float hunger, int level, String species) {
		super (happiness * value,  hunger * value,  level * value,  species);
	}
}

abstract class Action {
    public abstract String getCommand();
    public abstract String getMenuMessage();
    public abstract String doAction(Knoxagotchi pet);
}

class Eat extends Action {
    @Override
    public String getCommand() {
        return "EAT";
    }

    @Override
    public String getMenuMessage() {
        return "Feed your pet.";
    }    

    @Override
    public String doAction(Knoxagotchi pet) {
        pet.setHunger(pet.getHunger() - 0.25f);
        if(pet.getHunger() < 0.5) {
            pet.setHappiness(pet.getHappiness() + 0.25f);
            return "Your pet is satisfied!";
        }

        pet.setHappiness(pet.getHappiness() - 0.25f);
        return "You pet is still hungry!";
    }
}

class Exercise extends Action {
    @Override
    public String getCommand() {
        return "EXERCISE";
    }

    @Override
    public String getMenuMessage() {
        return "Exercise with your pet.";
    }    

    @Override
    public String doAction(Knoxagotchi pet) {
         pet.setHunger(pet.getHunger() + 0.25f);
        if(pet.getHunger() < 0.5) {
			pet.setHappiness(pet.getHappiness() + 0.1f);
            return "Your pet had a good workout!";
        }

		pet.setHappiness(pet.getHappiness() - 0.25f);
        return "You pet is exhausted and hungry!";
    }
}

class levelUp extends Action {
	@Override
	public String getCommand() {
		return "LEVEL_UP";
	}
	@Override
	public String getMenuMessage(){
		return "Level Up Your Pet";
	}
	@Override
    public String doAction(Knoxagotchi pet) {
       if(pet.getHappiness() > .5) {
		   pet.setLevel(pet.getLevel() + 1);
		   return "You leveled Up!";
	   }
	   else {
		   return "Your pet is not happy enough!";
	   }
    }
}