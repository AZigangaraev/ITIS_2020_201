//
//  BookDataService.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 22.02.2021.
//

import Foundation

class HardCodeBookDataService: BookDataService {

    var books: [Book] = [
        Book(name: "The Vanishing Half", authorName: "Brit Bennett", description: "Longlisted for the National Book Award, Brit Bennett’s ambitious novel follows two identical twin sisters from a small Southern town. One stays home in her Black community; the other passes for white in the wider world. Provocative and compassionate, Bennett’s book traces fascinating threads of American identity and is our hands-down winner for the 2020 Historical Fiction award.", likes: 211),
        Book(name: "Broken Glass", authorName: "Alain Mabanckou ", description: "The Congolese writer says he was “trying to break the French language” with Broken Glass – a black comedy told by a disgraced teacher without much in the way of full stops or paragraph breaks. As Mabanckou’s unreliable narrator munches his “bicycle chicken” and drinks his red wine, it becomes clear he has the history of Congo-Brazzaville and the whole of French literature in his sights.", likes: 96),
        Book(name: "Wolf Hall", authorName: "Hilary Mantel", description: "Mantel had been publishing for a quarter century before the project that made her a phenomenon, set to be concluded with the third part of the trilogy, The Mirror and the Light, next March. To read her story of the rise of Thomas Cromwell at the Tudor court, detailing the making of a new England and the self-creation of a new kind of man, is to step into the stream of her irresistibly authoritative present tense and find oneself looking out from behind her hero’s eyes. The surface details are sensuously, vividly immediate, the language as fresh as new paint; but her exploration of power, fate and fortune is also deeply considered and constantly in dialogue with our own era, as we are shaped and created by the past. In this book we have, as she intended, “a sense of history listening and talking to itself”.", likes: 142),
        Book(name: "Gilead", authorName: "Marilynne Robinson", description: "Robinson’s meditative, deeply philosophical novel is told through letters written by elderly preacher John Ames in the 1950s to his young son who, when he finally reaches an adulthood his father won’t see, will at least have this posthumous one-sided conversation: “While you read this, I am imperishable, somehow more alive than I have ever been.” This is a book about legacy, a record of a pocket of America that will never return, a reminder of the heartbreaking, ephemeral beauty that can be found in everyday life. As Ames concludes, to his son and himself: “There are a thousand thousand reasons to live this life, every one of them sufficient.” ", likes: 123),
        Book(name: "Never Let Me Go", authorName: "Kazuo Ishiguro ", description: "From his 1989 Booker winner The Remains of the Day to 2015’s The Buried Giant, Nobel laureate Ishiguro writes profound, puzzling allegories about history, nationalism and the individual’s place in a world that is always beyond our understanding. His sixth novel, a love triangle set among human clones in an alternative 1990s England, brings exquisite understatement to its exploration of mortality, loss and what it means to be human. ", likes: 93),
        Book(name: "The Amber Spyglass", authorName: "Philip Pullman", description: "Children’s fiction came of age when the final part of Pullman’s His Dark Materials trilogy became the first book for younger readers to win the Whitbread book of the year award. Pullman has brought imaginative fire and storytelling bravado to the weightiest of subjects: religion, free will, totalitarian structures and the human drive to learn, rebel and grow. Here Asriel’s struggle against the Authority reaches its climax, Lyra and Will journey to the Land of the Dead, and Mary investigates the mysterious elementary particles that lend their name to his current trilogy: The Book of Dust. The Hollywood-fuelled commercial success achieved by JK Rowling may have eluded Pullman so far, but his sophisticated reworking of Paradise Lost helped adult readers throw off any embarrassment at enjoying fiction written for children – and publishing has never looked back. ", likes: 54),
        Book(name: "Autumn", authorName: "Ali Smith", description: "Smith began writing her Seasonal Quartet, a still-ongoing experiment in quickfire publishing, against the background of the EU referendum. The resulting “first Brexit novel” isn’t just a snapshot of a newly divided Britain, but a dazzling exploration into love and art, time and dreams, life and death, all done with her customary invention and wit. ", likes: 42),
        Book(name: "Cloud Atlas", authorName: "David Mitchell", description: "The epic that made Mitchell’s name is a Russian doll of a book, nesting stories within stories and spanning centuries and genres with aplomb. From a 19th-century seafarer to a tale from beyond the end of civilisation, via 1970s nuclear intrigue and the testimony of a future clone, these dizzying narratives are delicately interlinked, highlighting the echoes and recurrences of the vast human symphony.", likes: 30)
    ]
    
    func getBooks() -> [Book] {
        books
    }
    
}
