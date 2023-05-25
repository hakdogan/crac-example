package org.jugistanbul.crac;

import org.crac.*;

/**
 * @author hakdogan (hakdogan75@gmail.com)
 * Created on 16.08.2022
 ***/

public class Greetings implements Resource
{
    private static int counter;

    public Greetings() {
        Core.getGlobalContext().register(this);
    }

    @Override
    public void beforeCheckpoint(Context<? extends Resource> context) throws Exception {
        System.out.println("resource pre-checkpoint");
    }

    @Override
    public void afterRestore(Context<? extends Resource> context) throws Exception {
        System.out.println("resource post-restore");
    }

    public static void main(String[] args) throws InterruptedException {

        while (counter < 10){
            System.out.println(String.format("%sth greetings from İstanbul", ++counter));
            Thread.sleep(1000);
        }

        try {
            Core.checkpointRestore();
        } catch (CheckpointException | RestoreException e) {
            throw new RuntimeException(e);
        }

        System.out.println("Done...");
    }
}
